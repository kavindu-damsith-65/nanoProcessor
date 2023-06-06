library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Program_Rom is
--  Port ( );
end TB_Program_Rom;

architecture Behavioral of TB_Program_Rom is
    component Program_Rom
        Port (
            romIn : in STD_LOGIC_VECTOR (2 downto 0);
            romOut : out STD_LOGIC_VECTOR (0 to 12)
        );
    end component;

    signal romIn : STD_LOGIC_VECTOR (2 downto 0);
    signal romOut : STD_LOGIC_VECTOR (0 to 12);

begin
    UUT: Program_Rom port map (
        romIn => romIn,
        romOut => romOut
    );
    
    process 
    begin
        -- Index number: 210249H = 110 011 010 101 001 001
        romIn <= "001"; -- Set romIn to "001"
        wait for 200ns;
        
        romIn <= "101"; -- Set romIn to "101"
        wait for 200ns;
        
        romIn <= "010"; -- Set romIn to "010"
        wait for 200ns;
        
        romIn <= "011"; -- Set romIn to "011"
        wait for 200ns;
        
        romIn <= "110"; -- Set romIn to "110"
        wait;
    end process;
   
end Behavioral;
