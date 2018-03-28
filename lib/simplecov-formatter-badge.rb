module SimpleCov
  module Formatter
    class BadgeFormatter
      RESULT_FILE_NAME = 'coverage.svg'

      def format(result)
        persent = result.covered_percent.to_i
        color = color_by(persent)
        File.open(result_file_path, "w" ) do |file|
          file.write <<~XML
            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="94" height="20">
            <linearGradient id="b" x2="0" y2="100%">
              <stop offset="0" stop-color="#bbb" stop-opacity=".1"/>
              <stop offset="1" stop-opacity=".1"/>
            </linearGradient>
            <clipPath id="a">
              <rect width="94" height="20" rx="3" fill="#fff"/>
            </clipPath>
            <g clip-path="url(#a)">
              <path fill="#555" d="M0 0h59v20H0z"/>
              <path fill="#{color}" d="M59 0h35v20H59z"/>
              <path fill="url(#b)" d="M0 0h94v20H0z"/>
            </g>
            <g fill="#fff" text-anchor="middle" font-family="DejaVu Sans,Verdana,Geneva,sans-serif" font-size="110">
              <text x="305" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)" textLength="490">coverage</text>
              <text x="305" y="140" transform="scale(.1)" textLength="490">coverage</text>
              <text x="755" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)" textLength="250">#{persent}%</text>
              <text x="755" y="140" transform="scale(.1)" textLength="250">#{persent}%</text></g>
            </svg>
          XML
        end
      end

      def result_file_path
        File.join(SimpleCov.coverage_path, RESULT_FILE_NAME)
      end

      def color_by(persent)
        if persent > 90
          '#4c1'
        elsif persent > 80
          '#dfb317'
        else
          '#e05d44'
        end
      end
    end
  end
end
