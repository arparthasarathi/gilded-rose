class GildedRose

  def initialize(items)
    @items = items
  end

  def increment_quality(item)

    # Quality cannot exceed 50
    if item.quality < 50
      item.quality = item.quality + 1
    end

  end

  def decrement_quality(item, times)

    # Decrement quality only if positive
    if item.quality > 0
      difference = item.quality - times

      # Quality can never be negative
      item.quality = difference ? 0 : difference
    end

  end

  def decrement_sell_in(item)

    # Decrement sell_in
    item.sell_in = item.sell_in - 1

  end

  def update_quality

    @items.each do |item|

      case item.name

      when "Aged Brie"

        # Always increase in quality

        increment_quality(item)

        # Decrease sell in

        decrement_sell_in(item)

      when "Backstage passes to a TAFKAL80ETC concert"

        # Increment quality if sell_in is positive
        # else set it to 0
        if item.sell_in > 0

          # Increment quality by once
          increment_quality(item)

          if item.sell_in < 11
            # Increment quality by twice
            increment_quality(item)
          end

          if item.sell_in < 6
            # Increment quality by thrice
            increment_quality(item)
          end

          decrement_sell_in(item)

        else

          item.quality = 0

        end

      when "Sulfuras, Hand of Ragnaros"

        item.quality = 80

      when "Conjured Mana Cake"

        # Decrement quality twice as other items

        decrement_quality(item, 2)

        # Decrement sell_in

        decrement_sell_in(item)

        if item.sell_in < 0

          # Decrement quality twice if sell_in is less than 0
          decrement_quality(item, 2)

        end

      else

        decrement_quality(item, 1)

        decrement_sell_in(item)

        if item.sell_in < 0
          decrement_quality(item, 1)
        end

      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end