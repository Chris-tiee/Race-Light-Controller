library IEEE;
use IEEE.std_logic_1164.all;

entity jkff is
  port (
    i_clk : in std_logic;
    i_clr_n : in std_logic;
    i_j : in std_logic;
    i_k : in std_logic;
    o_q : out std_logic;
    o_q_n : out std_logic
  );
end jkff;

architecture beh of jkff is
  signal q : std_logic;
  signal q_n : std_logic;
begin
  process (i_clk, i_clr_n, i_j, i_k) 
    variable jk : std_logic_vector (1 downto 0) := "00";
  begin
    jk := i_j & i_k;
    if i_clr_n = '0' then
      q <= '0';
      q_n <= '1';
    elsif rising_edge(i_clk) then
      case jk is
        when "00" =>
          null;
        when "01" =>
          q <= '0';
          q_n <= '1';
        when "10" =>
          q <= '1';
          q_n <= '0';
        when "11" =>
          q <= q_n;
          q_n <= q;
        when others => 
          null;
      end case;
    end if;
  end process;
  
  o_q <= q;
  o_q_n <= q_n;
end beh;

