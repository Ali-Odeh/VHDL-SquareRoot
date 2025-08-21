library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
--------------------------------------- 
entity ASM_SQR_TB is
end ASM_SQR_TB;
---------------------------------------
architecture Behavioral of ASM_SQR_TB is
    Component  SQR is
        port (
            CK, R, S : in std_logic;
            X : in std_logic_vector(7 downto 0);
            Sqrt : out std_logic_vector(7 downto 0)
        );
    end Component;

  ---------------------------------------  
    -- {INPUT}
    signal CK : std_logic := '0';
    signal R : std_logic := '0';
    signal S : std_logic := '0';
    signal X : std_logic_vector(7 downto 0);
    
    -- {OUTPUT}
    signal Sqrt : std_logic_vector(7 downto 0);
---------------------------------------
constant P : time := 4 ns;
begin

     DUT : SQR
        port map (
            CK => CK,
            R => R,
            S => S,
            X => X,
            Sqrt => Sqrt  );
---------------------------------------            
     CK_Generation: process
     begin
           loop
                CK <= '0';
                wait for P/2;
                CK <= '1';
                wait for P/2;
           end loop;
    end process;
---------------------------------------
     Test_Process: process
     begin
           R <= '1';
           wait for 5 * P;
        
           R <= '0';
           wait for 10 * P;
 
           for i in 0 to 255 loop
             X <= std_logic_vector(to_unsigned(i, X'length));

             S <= '1';
             wait for 2 * P;
            
             S <= '0';
             wait for 30 * P;
             
         end loop;
        wait;
    end process;
    
    
end Behavioral;
