# encoding: utf-8

# Read a Ruby file within Ruby file with local variables
# bound to the context of this method.
def eval_script(filename, *args)
  proc = Proc.new {}
  eval File.read(filename), proc.binding, filename
end
