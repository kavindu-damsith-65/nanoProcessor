library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Add_3 is
--  Port ( );
end TB_Add_3;

architecture Behavioral of TB_Add_3 is
    component Adder_3_bit
        port ( a : in STD_LOGIC_VECTOR (2 downto 0); -- Input A
               b : in STD_LOGIC_VECTOR (2 downto 0); -- Input B
               s : out STD_LOGIC_VECTOR (2 downto 0) -- Sum output
        );
    end component;

    signal a, b, s : STD_LOGIC_VECTOR (2 downto 0) := "000"; -- Input and output signals

begin
    UUT: Adder_3_bit port map (
        a => a,
        b => b,
        s => s
    );
        
    process
    begin
        -- Test Cases
        -- Index number : 210648F = 110 011 011 011 011 000
        -- 000 + 011 = 0 + 3 = 3
        a <= "000";
        b <= "011";
        wait for 100ns;
        
        -- 011 + 011 = 3 + 3 = 6
        a <= "011";
        b <= "011";
        wait for 100ns;
        
        -- 011 + 110 = 3 + 6 = 9
        a <= "011";
        b <= "110";
        wait;
    end process;
       
end Behavioral;
