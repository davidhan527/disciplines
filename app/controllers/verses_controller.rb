class VersesController < ApplicationController
  def index
  end

  def text
    @text = VerseFinder.new(params[:verse]).verses
    render :index
  end

  private

  class VerseFinder
    include HTTParty
    base_uri 'www.esvapi.org'

    def initialize(passage)
      @options = { query: default_params.merge(passage: passage) }
    end

    def default_params
      {
        key: 'IP',
        'include-footnotes': false,
      }
    end

    def verses
      self.class.get("/v2/rest/passageQuery", @options)
    end
  end
end
