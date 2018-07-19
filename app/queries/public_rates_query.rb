class PublicRatesQuery
  def initialize(relation = Rate.all)
    @relation = relation
  end

  def last
    last_active_forced || last_non_forced
  end

  def self.last
    new.last
  end

  private

  def last_active_forced
    @relation.forced.where('expires_at > ?', Time.zone.now).last
  end

  def last_non_forced
    @relation.non_forced.last
  end
end
