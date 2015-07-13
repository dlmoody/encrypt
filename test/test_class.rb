require_relative "encryptor"
require "test/unit"
 
class TestClass < Test::Unit::TestCase
 
 
    def test_encrypts_values_in_rotation_mode
        d = Encryptor.new()
        value_to_encrypt = "This is a value that I want to encrypt"
        encrypted = d.encrypt(value_to_encrypt) 
        decrypted_value = d.decrypt(encrypted)
        assert_equal(value_to_encrypt, decrypted_value )
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