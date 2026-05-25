#!/usr/bin/env ruby
#!/usr/bin/env ruby
require 'optparse'

TASKS_FILE = 'tasks.txt'

def load_tasks
  if File.exist?(TASKS_FILE)
    File.readlines(TASKS_FILE).map(&:strip).reject(&:empty?)
  else
    []
  end
end

def save_tasks(tasks)
  File.open(TASKS_FILE, 'w') do |file|
    tasks.each { |task| file.puts(task) }
  end
end

options = {}

opt_parser = OptionParser.new do |opts|
  opts.banner = "Usage: cli.rb [options]"

  opts.on("-a", "--add TASK", "Add a new task") do |task|
    options[:add] = task
  end

  opts.on("-l", "--list", "List all tasks") do
    options[:list] = true
  end

  opts.on("-r", "--remove INDEX", "Remove a task by index") do |index|
    options[:remove] = index.to_i
  end

  opts.on("-h", "--help", "Show help") do
    puts opts
    exit
  end
end

begin
  opt_parser.parse!(ARGV)
rescue OptionParser::InvalidOption, OptionParser::MissingArgument => e
  puts e.message
  puts opt_parser
  exit 1
end

if options[:add]
  tasks = load_tasks
  tasks << options[:add]
  save_tasks(tasks)
  puts "Task '#{options[:add]}' added."

elsif options[:list]
  tasks = load_tasks
  if tasks.empty?
    puts "No tasks found."
  else
    puts "Tasks:"
    tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task}"
    end
  end

elsif options[:remove]
  tasks = load_tasks
  index_to_remove = options[:remove] - 1

  if index_to_remove >= 0 && index_to_remove < tasks.length
    removed_task = tasks.delete_at(index_to_remove)
    save_tasks(tasks)
    puts "Task '#{removed_task}' removed."
  else
    puts "Invalid task index."
  end
end
