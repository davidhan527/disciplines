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
        'include-verse-numbers': false,
        'include-headings': false,
        'include-first-verse-numbers': false,
        'output-format': 'plain-text',
        'include-passage-horizontal-lines': false,
        'include-heading-horizontal-lines': false,
      }
    end

    def verses
      self.class.get("/v2/rest/passageQuery", @options)
    end
  end
end
