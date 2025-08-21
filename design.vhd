-- {Ali Odeh 12112361}

library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_unsigned.all;
--use IEEE.numeric_std.all;

--------------

entity SQR is
  port (
    CK, R, S : in std_logic;
    X : in std_logic_vector(7 downto 0);
    Sqrt : out std_logic_vector(7 downto 0)
  );
end SQR;

---------------------------------------------
architecture BEH of SQR is

  type State is (T_Initial,T0, T1, T2, T3, T4);
  signal CS, NS : State; -- CS => Current State, NS => Next State
  signal a, q, d, SqrtI : std_logic_vector(7 downto 0) := "00000000";

begin

------------------

  process (CS, S) -- {Combinational Operation}  
  begin
    case CS is
      when T_Initial =>
         NS <= T0; 
      when T0 =>
        if S = '0' then
          NS <= T0;
        else
          NS <= T1;
        end if;
      when T1 =>
        NS <= T2;
      when T2 =>
        if q > a then
          NS <= T3;
        else 
          NS <= T1;
        end if;
      when T3 =>
        NS <= T4;
      when T4 =>
        NS <= T0;
    end case;
  end process;
  
---------------------------

  process (R, CK) -- {Registered Operation}
  begin
    if R = '1' then
      CS <= T0;
    elsif (CK 'event and CK = '1') then
      CS <= NS;
    end if;
  end process;
  
------------------------------------

  process (CK) -- {Output Operation}
  begin
    if (rising_edge(CK)) then
      case CS is
      when T_Initial =>
        Sqrt <= "00000000"; 
        when T0 =>
          if S = '1' then
            a <= X;
            q <= "00000001";
            d <= "00000011";
          end if;
        when T1 =>
          q <= q + d;
        when T2 =>
          d <= d + "00000010";
        when T3 =>
          d <= d srl 1;
        when T4 =>
          Sqrt <= d - "00000001";
      end case;
    end if;
  end process;
---------------
end BEH;
