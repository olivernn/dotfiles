# encoding: UTF-8
require 'pp'
require 'rubygems'

require 'irb/completion'
require 'irb/ext/save-history'

require 'mkmf'

IRB.conf[:SAVE_HISTORY] = 1_000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

module ANSI
  Reset      =  "\e[0m"
  Bold       =  "\e[1m"
  Underline  =  "\e[4m"
  LightGrey  =  "\e[0;37m"
  Grey       =  "\e[1;30m"
  Red        =  "\e[31m"
  Green      =  "\e[32m"
  Yellow     =  "\e[33m]"
  Blue       =  "\e[34m"
  Magenta    =  "\e[35m"
  Cyan       =  "\e[36m"
  White      =  "\e[37m"
end

IRB.conf[:PROMPT][:OLIVERNN] = {
  :PROMPT_I => "#{ANSI::Red + ANSI::Bold}ruby (#{RUBY_VERSION})\n✎  #{ANSI::Reset}",
  :PROMPT_S => "",
  :PROMPT_C => "",
  :PROMPT_N => "",
  :RETURN => "#{ANSI::White}%s\n#{ANSI::Reset}",
  :AUTO_INDENT => true
}

IRB.conf[:PROMPT_MODE] = :OLIVERNN

def pbcopy(data, path = nil)
  if pbcopy_path = find_executable0("pbcopy", path)
    IO.popen(pbcopy_path, 'w') { |io| io.write(data) }
  else
    fail NotImplementedError, "pbcopy is not available in #{path.nil? ? ENV['PATH'] : path}"
  end
end

def pbpaste(path = nil)
  if pbpaste_path = find_executable0("pbpaste", path)
    IO.popen(pbpaste_path, 'r').read
  else
    fail NotImplementedError, "pbpaste is not available in #{path.nil? ? ENV['PATH'] : path}"
  end
end

