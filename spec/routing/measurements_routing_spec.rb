require "rails_helper"

RSpec.describe Api::V1::MeasurementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/v1/intakes/1/measurements").to route_to("api/v1/measurements#index",intake_id: "1")
    end

    it "routes to #show" do
      expect(get: "api/v1/intakes/1/measurements/1").to route_to("api/v1/measurements#show", id: "1",intake_id: "1")
    end


    it "routes to #create" do
      expect(post: "api/v1/intakes/1/measurements").to route_to("api/v1/measurements#create",intake_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "api/v1/intakes/1/measurements/1").to route_to("api/v1/measurements#update", id: "1",intake_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "api/v1/intakes/1/measurements/1").to route_to("api/v1/measurements#update", id: "1",intake_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "api/v1/intakes/1/measurements/1").to route_to("api/v1/measurements#destroy", id: "1",intake_id: "1")
    end
  end
end
