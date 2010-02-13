config = YAML.load_file(File.join(Rails.root,'config','mongodb.yml'))[Rails.env]

MongoMapper.connection = Mongo::Connection.new(config['host'], config['port'], {
  :logger         => Rails.logger
})

MongoMapper.database = config['database']
if config['username'].present?
  MongoMapper.database.authenticate(config['username'], config['password'])
end

Dir[Rails.root + 'app/models/**/*.rb'].each do |model_path|
  File.basename(model_path, '.rb').classify.constantize
end
MongoMapper.ensure_indexes!

ActionController::Base.rescue_responses['MongoMapper::DocumentNotFound'] = :not_found

if defined?(PhusionPassenger)
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    # if using older than 0.6.5 of MM then you want database instead of connection
    # MongoMapper.database.connect_to_master if forked
    MongoMapper.connection.connect_to_master if forked
  end
end
