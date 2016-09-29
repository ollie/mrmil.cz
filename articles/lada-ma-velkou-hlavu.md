    C:\JarmileHynkuVilemino\WWW\>ruby lada.rb
    #<Lada @hlava=#<Hlava @jako=#<Pytel @od=#<Banan>>, @velikost="Velka">>

### Kód

    class Pisnicka
      def self.zpivej
        lada = Lada.new
        yield lada
        p lada
      end
    end

    class Lada
      attr_accessor :hlava
    end

    class Hlava
      def initialize(config)
        config.each_pair do |name, value|
          instance_variable_set("@#{name}", value)
        end
      end
    end

    class Banan
    end

    class Pytel
      def initialize(od:)
        @od = od
      end
    end

    Pisnicka.zpivej do |lada|
      lada.hlava = Hlava.new(velikost: 'Velka', jako: Pytel.new(od: Banan.new))
    end
