require 'spec_helper'

describe Stream do
   
     before { @stream = Stream.new(id: "20",stream_id: "20", stream_name: "Testing") }

     subject { @stream }
     it { should respond_to(:reverse_stream_users) }
     it { should respond_to(:users) }

     it { should be_valid }



end
