library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_ALU is
end TB_ALU;

architecture Behavioral of TB_ALU is
    component ALU
        Port (
            a : in STD_LOGIC_VECTOR (3 downto 0);
            b : in STD_LOGIC_VECTOR (3 downto 0);
            sel : in STD_LOGIC; -- Add/Sub Selector
            s : out STD_LOGIC_VECTOR (3 downto 0);
            cOut : out STD_LOGIC; -- Carry flag
            zOut : out STD_LOGIC; -- Zero flag
            nOut : out STD_LOGIC; -- Negative flag
            pOut : out STD_LOGIC -- Parity flag
        );
    end component;

    signal a, b, s : STD_LOGIC_VECTOR (3 downto 0);
    signal sel, cOut, zOut, nOut, pOut: STD_LOGIC;

begin
    UUT: ALU PORT MAP(
        a => a,
        b => b,                   
        sel => sel,
        s => s,        
        cOut => cOut,
        zOut => zOut,
        nOut => nOut,
        pOut => pOut
    ); 
    
    process
    begin
        -- sel = 0 : Adder
        -- sel = 1 : Subtractor (Negates a)    
        
        -- Index number : 210249H = 11 0011 0101 0100 1001
        -- 1001 + 0100 = -7 + 4 = -3
        sel <= '0';
        a <= "1001";
        b <= "0100";
        wait for 100ns; 
        
        -- 0101 - 0011 = 5 - 3 = 2  subtract a from B 
        sel <= '1';
        a <= "0011";
        b <= "0101";
        wait for 100ns; 
        
        -- Reset
        sel <= '0';
        a <= "0000";
        b <= "0000";
        wait;  
    end process;
end Behavioral;
