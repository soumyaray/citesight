# This class extracts and counts APA-style citations in a paper.
# The unique_cites method returns a hash of citations and counts
# in the order in which they were encountered.
class PaperCitations
  def self.unique_cites(contents)
    new(contents).unique_cites
  end

  def self.index_cite(contents, cite)
    new(contents).index_cite(cite)
  end

  def initialize(contents)
    @contents = contents
  end

  def unique_cites
    clean_cites = @contents.scan(cite_match).map do |c|
      c[0].gsub(/[\(\),;]|([\'\u2019]s)/, '').gsub(/[\'\u2019]\s/, ' ')
    end

    Hash[clean_cites.group_by { |c| c }.map { |cit, num| [cit, num.count] }]
  end

  def index_cite(cite)
    cite_parts = cite.split
    author_s = cite_parts.take(cite_parts.size-1)
    year_s = cite_parts.last
    @contents.enum_for(:scan, /#{author_s}#{possessive}?#{year(year_s)}/x
                      ).map { Regexp.last_match.begin(0) }
  end

  private

  def prefix() '(([dD]e|[vV]an[ ]?[dD]er)[ ]?)' end
  def author() "(#{prefix}?[A-Z][[:alpha:]\'\u2019\-]+)" end
  def other_authors() "([ ]and[ ]#{author} | ([ ]et[ ]al.){1})" end
  def possessive() "([\'\u2019]s|s[\'\u2019])" end
  def year_literal() "[1-2][0-9]{3}[a-z]?" end
  def year(literal) "([ ][\(]?#{literal}[,\)\;])" end

  def cite_match
    /( #{author}{1}#{other_authors}?#{possessive}?#{year(year_literal)} )/x
  end
end
