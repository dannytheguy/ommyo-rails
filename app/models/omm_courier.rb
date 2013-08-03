class OmmCourier < ActiveRecord::Observer
  observe :omm

  def after_save(omm)
  end
end
