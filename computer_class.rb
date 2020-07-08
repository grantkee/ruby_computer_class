class Computer
  @@users = {}

  def initialize username, password
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end

  def create filename
    time = Time.now
    name = filename.to_sym
    @files[name] = time
    puts "A new file: #{filename} was created at #{time} by #{@username}"
  end

  def update filename, new_filename
    @files[filename] = new_filename if @files[filename]
    puts "#{filename} name changed to #{new_filename}"
  end

  def list_all
    @files.each {|k, v| puts "#{k}: #{v}" if k.is_a? Symbol}
  end

  def Computer.get_users
    puts "getting users..."
    return @@users
  end
end

my_computer = Computer.new("bigG", "REDACTED")

my_computer.create("trash.txt")

my_computer.update("trash.txt", "new.pdf")

my_computer.list_all