# This class extracts and counts APA-style citations in a paper.
# The unique_cites method returns a hash of citations and counts
# in the order in which they were encountered.
class PaperCitations
  def self.unique_cites(contents)
    new(contents).unique_cites
  end

  def initialize(contents)
    @contents = contents
  end

  def unique_cites
    # clean citations of slashes, commas, semi-colons, possesives
    clean_cites = @contents.scan(cite_match).map do |c|
      c[0].gsub(/[\(\),;]|([\'\’]s)/, '').gsub(/[\'\’]\s/, ' ')
    end

    # create hash of citations (key) with counts (value)
    Hash[clean_cites.group_by { |c| c }.map { |k, v| [k, v.count] }]
  end

  private

  def prefix
    '(([dD]e|[vV]an[ ]?[dD]er)[ ]?)'
  end

  def name
    "(#{prefix}?[A-Z][[:alpha:]\'\’\-]+)"      # name: caps, accents, 's
  end

  def cite_match
    /(
      #{name}{1}                                    # first author
      ([ ]and[ ]#{name} | ([ ]et[ ]al.){1})?        # remaining authors
      ([\'\’]s|s[\'\’])?                            # possessive form
      ([ ][\(]?[1-2][0-9]{3}[a-z]?[,\)\;])          # year
    )/x
  end
end
