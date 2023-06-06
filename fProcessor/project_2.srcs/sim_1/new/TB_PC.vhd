library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_PC is
--  Port ( );
end TB_PC;

architecture Behavioral of TB_PC is
    component PC
        Port (
            pcIn : in STD_LOGIC_VECTOR (2 downto 0);
            clk : in STD_LOGIC;
            res : in STD_LOGIC;
            pcOut : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    signal clk : STD_LOGIC := '0';
    signal pcIn, pcOut : STD_LOGIC_VECTOR (2 downto 0);
    signal res : STD_LOGIC;

begin
    UUT: PC port map (
        pcIn => pcIn,
        clk => clk,
        res => res,
        pcOut => pcOut
    );
    
    process 
    begin
        wait for 20ns;
        clk <= NOT clk;
    end process;
    
    process 
    begin
        -- Index number: 210249H = 110 011 010 101 001 001
        res <= '1'; -- Set res to 1
        wait for 100ns;
        
        res <= '0'; -- Clear res
        pcIn <= "001"; -- Set pcIn to "001"
        wait for 200ns;
        
        pcIn <= "101"; -- Set pcIn to "101"
        wait for 200ns;
        
        pcIn <= "010"; -- Set pcIn to "010"
        wait for 200ns;
        
        pcIn <= "011"; -- Set pcIn to "011"
        wait for 200ns;
        
        pcIn <= "110"; -- Set pcIn to "110"
        wait for 200ns;
        
         res <= '1'; -- Set res to 1
        wait ;
    end process;

end Behavioral;
