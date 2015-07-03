module FactoryHelper
  def create_model(model, options = {})
    FactoryGirl.create model, options
  end

  def attributes_for(model)
    FactoryGirl.attributes_for(model)
  end

  def method_missing(name, *args, &block)
    model = name.to_s.gsub(/^create_/, "")
    begin
      FactoryGirl.create model.to_sym, *args
    rescue
      super
    end
  end
end