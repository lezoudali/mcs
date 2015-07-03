require 'spec_helper'

describe FashionModelsVideo do
  let(:model_video) { create_fashion_models_video }
   subject { model_video }

   it { should belong_to(:fashion_model) }
   it { should belong_to(:video) }

   it { should respond_to(:fashion_model_id)}
   it { should respond_to(:video_id)}

   it { should validate_presence_of :fashion_model_id }
   it { should validate_presence_of :video_id }

   describe "associations" do 
    before do 
      @fashion_model = create_fashion_model
      @video = create_video
      @model_video = create_fashion_models_video fashion_model_id: @fashion_model.id, video_id: @video.id
    end

    it "returns #fashion_model" do 
      expect(@model_video.fashion_model).to eql(@fashion_model)
    end

    it "returns #video" do 
      expect(@model_video.video).to eql(@video)
    end
   end
end
