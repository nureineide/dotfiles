load_snippets "~/.sonic-pi/snippets", quiet: true

def my_samples
  '~/data/music-samples'
end


# helper functions for reading values from the knobs of my midi keyboard
def translate_knob(knob_cc)
  case knob_cc
  when 14 then :knob1
  when 15 then :knob2
  when 16 then :knob3
  when 17 then :knob4
  end
end

def kn1(max_value: 10)
  (get(:knob1) || 1) * max_value / 127
end

def kn2(max_value: 10)
  (get(:knob2) || 1) * max_value / 127
end

def kn3(max_value: 10)
  (get(:knob3) || 1) * max_value / 127
end

def kn4(max_value: 10)
  (get(:knob4) || 1) * max_value / 127
end


# helper functions for mapping pad (or really any other key) from a midi keyboard
# to triggering a sample ... needs `live_loop :midi_pads` and `live_loop :map_pads`
# for fully functioning
def translate_pad(pad_index)
  case pad_index
  when 36 then :pad1
  when 38 then :pad2
  when 40 then :pad3
  when 41 then :pad4
  end
end

def map_pad(pad, sample:, dir: nil)
  set pad, [dir, sample]
end

def play_pad(pad_index, velocity)
  dir, smpl = get translate_pad(pad_index)
  sample dir, smpl, amp: (velocity*5)/127
end


# helper for setting bpm that is read from & written to a shared variable
def bpm(value)
  if value.nil?
    use_bpm get(:bpm) if get(:bpm)
  elsif value != get(:bpm)
    set :bpm, value
    use_bpm value
  end
end
