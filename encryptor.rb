class Encryptor
    attr_reader :rotation, :mode
    
    def initialize(rotation = 0)
        @rotation = rotation
        @rotations = [4, 6, 8]
        @pointer = 0
        if(@rotation == 0)
            @mode = mode_rotation
        else
            @mode = mode_single
        end 
    end
    
    def encrypt(value)
        letters = value.split("")
        @pointer = 0
        encrypted = letters.collect do | letter |
            if(@mode == mode_rotation)
                encrypt_letter(letter, pointer)
            elsif(@mode == mode_single)
                encrypt_letter(letter, @rotation)
            end
        end
        encrypted.join
    end
    
    def decrypt(value)
        letters = value.split("")
        @pointer = 0
        decrypted = letters.collect do | letter |
            if(@mode == mode_rotation)
                decrypt_letter(letter, pointer)
            elsif(@mode == mode_single)
                decrypt_letter(letter, @rotation)
            end
        end
        decrypted.join
    end
    
    def encrypt_file(in_path)
        
        if(File.exists?(in_path))
            out_path = in_path + ".encrypted"
            in_file = File.open(in_path, "r")
            in_message = in_file.read
            in_file.close
            out_message = encrypt(in_message)
            out_file = File.open(out_path, "w")
            out_file.write(out_message)    
            out_file.close
        else
            puts "The file #{in_path} does not exist"
        end
        
    end
    
    def decrypt_file(in_path)
        if(File.exists?(in_path))
            out_path = in_path.gsub("encrypted", "decrypted")
            in_file = File.open(in_path, "r")
            in_message = in_file.read
            in_file.close
            out_message = decrypt(in_message)
            out_file = File.open(out_path, "w")
            out_file.write(out_message)    
            out_file.close
        
        else
            puts "The file #{in_path} does not exist"
        end
        
    end
    
    
    def pointer
        if(( @pointer + 1 ) > ( @rotations.length - 1 ) )
            @pointer = 0
        else
            @pointer += 1
        end
    end
    
    def mode_single
        "single"
    end
    
    def mode_rotation
        "rotation"
    end
    
    def encrypt_letter(letter, rotation)
        current_cipher = cipher(rotation)
        current_cipher[letter]
    end
    
    def decrypt_letter(letter, rotation)
        current_cipher = cipher(rotation)
        current_cipher.key(letter)
    end
    
    def cipher(rotation)
        characters = (' '..'z').to_a
        rotated_characters = characters.rotate(rotation)
        Hash[characters.zip(rotated_characters)]
    end
end