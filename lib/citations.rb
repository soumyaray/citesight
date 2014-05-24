
class PaperCitations

  def self.unique_cites(contents)
    prefix = "(([dD]e|[vV]an[ ]?[dD]er)[ ]?)"
    name = "(#{prefix}?[A-Z][[:alpha:]\'\’\-]+)"      # name: caps, accents, 's

    cite_match = %r{(
      #{name}{1}                                    # first author
      ([ ]and[ ]#{name} | ([ ]et[ ]al.){1})?        # remaining authors
      ([\'\’]s|s[\'\’])?                            # possessive form
      ([ ][\(]?[1-2][0-9]{3}[a-z]?[,\)\;])          # year
    )}x

    # clean citations of slashes, commas, semi-colons, possesives
    clean_cites = contents.scan(cite_match).map do |c|
      c[0].gsub(/[\(\),;]|([\'\’]s)/, '').gsub(/[\'\’]\s/, ' ')
    end

    # create hash of citations (key) with counts (value)
    Hash[clean_cites.group_by { |c| c }.map { |k, v| [k, v.count]} ]
  end

end
