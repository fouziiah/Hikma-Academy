# frozen_string_literal: true

class AboutController < ApplicationController
  def index
    @mission = 'Nurturing hearts and minds through engaging courses in Islamic studies and personal development.'
    @vision = 'We envision a world in which Muslims are intentionally living their faith and deeply rooted in their connection with their Creator.'
  end
end
