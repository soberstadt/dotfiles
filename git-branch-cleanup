#!/usr/bin/env ruby

deleted_branches = `git fetch -p --dry-run 2>&1 | grep deleted`.split("\n")
deleted_branches = deleted_branches.map do |line|
  line.split('origin/')[1]
end

my_branch_statuses = `git for-each-ref --format="%(refname:short) %(upstream:track)" refs/heads`.split("\n")

branches_to_delete = []
keep = []
deleted_branches.each do |branch_name|
  next if ['master', 'staging'].include? branch_name
  status = my_branch_statuses.find { |l| l.start_with? "#{branch_name} " }
  next unless status
  if status.include? ' [ahead '
    keep << status
  else
    branches_to_delete << status
  end
end

puts 'no branches to delete' and return if branches_to_delete.empty?

git_delete = "git branch -D #{branches_to_delete.map {|s| s.split(' ')[0] }.join(' ')}"

puts 'branches ready to delete: '
puts branches_to_delete
puts git_delete
puts ' '
puts 'ready? [y]/n'

ready = gets.chomp.to_s.downcase
puts ' '
if ready == '' || ready == 'y' || ready == 'yes'
  puts `#{git_delete}`
  puts 'doing the actual prune...'
  `git fetch -p 2>&1`
  puts ' '
  if keep.any?
    puts 'we kept:'
    puts keep
  end
else
  puts 'cool, whatever...'
end
