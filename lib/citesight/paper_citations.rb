# This class extracts and counts MISQ or APA style citations in a paper.
# The unique_cites method returns a hash of citations and counts
# in the order in which they were encountered.
module CiteSight
  class PaperCitations
    def initialize(contents)
      @contents = contents
    end

    def unique_cites
      clean_cites = @contents.scan(cite_match).map do |c|
        remove_punctuation(c[0])
      end

      Hash[clean_cites.group_by { |c| c }.map { |cit, num| [cit, num.count] }]
    end

    ##
    # Returns array of citation locations (index) in manuscript
    #
    #     contents = File.read('./spec/testfiles/test.txt')
    #     PaperCitations.index_cite(contents, 'Peters et al. 2007')
    #     # => [219, 500]
    def index_of_cite(cite)
      cite_parts = cite.split
      author_s = cite_parts.take(cite_parts.size-1).join(' ')
      year_s = cite_parts.last
      @contents.enum_for(:scan, /(#{author_s}#{possessive}?#{year(year_s)})/
                        ).map { Regexp.last_match.begin(0) }
    end

    private

    def apostrophe() "\'\u2019" end
    def prefix() '(([dD]e|[vV]an[ ]?[dD]er)[ ]?)' end
    def author() "(#{prefix}?[A-Z][[:alpha:]#{apostrophe}\-]+)" end
    def other_authors() "([ ](and|\&)[ ]#{author} | ([ ]et[ ]al.){1})" end
    def possessive() "([#{apostrophe}]s|[#{apostrophe}])" end
    def year_literal() "[1-2][0-9]{3}[a-z]?" end
    def year(yr) "([,]?[ ][\(]?#{yr}[,\)\;])" end

    def cite_match
      /( #{author}{1}#{other_authors}?#{possessive}?#{year(year_literal)} )/x
    end

    def remove_punctuation(cite)
      cite
        .gsub(/[\(\),;]|([#{apostrophe}]s)/, '')
        .gsub(/[#{apostrophe}]\s/, ' ')
        .gsub(/\&/, 'and')
    end
  end
end
