require_relative "encryptor"
require "test/unit"
 
class TestClass < Test::Unit::TestCase
 
 
    def test_encrypts_values_in_rotation_mode
        d = Encryptor.new()
       
        assert_equal("ecvjf", d.encrypt("david") )
    end
    
    def test_decrypts_values_in_rotation_mode
        d = Encryptor.new()
        
        assert_equal("david", d.decrypt("ecvjf") )
    end
    
    def test_encrypts_values_in_single_mode
        d = Encryptor.new(13)
       
        assert_equal("qn(vq", d.encrypt("david") )
    end
    
    def test_decrypts_values_in_single_mode
        d = Encryptor.new(13)
        
        assert_equal("david", d.decrypt("qn(vq") )
    end
 
    
 end