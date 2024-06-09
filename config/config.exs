import Config

config :n2o,
  port: 8080,
  igor: "deps/n2o/src/protos",
  app: :infotech_test_task,
  pickler: :n2o_secret,
  mq: :n2o_syn,
  upload: "./priv/static",
  event: :pickle,
  nitro_prolongate: true,
  ttl: 60,
  protocols: [:nitro_n2o, :n2o_ftp, :n2o_heart],
  routes: Routes,
  origin: "*",
  session: :n2o_session
