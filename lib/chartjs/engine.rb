require 'chartjs/chart_helpers'

module Chartjs
  class Engine < Rails::Engine
     # for importmap
    initializer "chartjs.importmap" do |app|
      if defined?(Importmap)
        app.config.assets.precompile << "chart.js"
        app.config.assets.precompile << "Chart.bundle.js"
      end
    end
    
    initializer 'chartjs.chart_helpers' do
      if ::Chartjs.no_conflict
        ActionView::Base.send :include, Chartjs::ChartHelpers::Explicit
      else
        ActionView::Base.send :include, Chartjs::ChartHelpers::Implicit
      end
    end
  end
end
