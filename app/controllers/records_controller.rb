class RecordsController < ApplicationController
  helper_method :resources

  protected

    def resource_association
      Record.all
    end

    def resources
      resource_association
    end
end
