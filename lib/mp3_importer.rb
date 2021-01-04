
class MP3Importer
    attr_accessor :path


    def initialize(file_path)
        @path = file_path
    end

    def parse(file)
        file.split(/[-.]/)
    end


    def files
        # Dir.chdir "/Users/connorholland/Desktop/Flatiron/ModOne/OOP/ruby-oo-object-relationships-collaborating-objects-lab/spec/fixtures/mp3s"
        # return Dir.glob("*.mp3")

        Dir.children(@path)

    end

    def import
        files.each do |file|
            Song.new_by_filename(file)
        end
    end




end