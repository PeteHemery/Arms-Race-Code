library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all; -- changed from unsigned.
-- use work.COUNTDOWN_PACKAGE.all;
-- library altera;
-- use altera.maxplus2.all;

-- Title "Keypad encoder circuit"
-- Prepared by: D.N. Warren-Smith
-- Updated: 14 February 2001
-- Modified by N. J. Gunton
-- Date 6th February 2008 & March 2011

-- Modified by Pete Hemery
-- Date 28/02/2012 & 11/03/2012
-- Renamed file to keypad_controller.vhd to instantiate
-- the component as keypad instead of keypad_0
-- (since the instantiation can't be the same name
-- as the toplevel vhd file in sopc builder)
-- Added latch_n signal to include in the shift register.
-- It gets set when NKP is 1,
-- it is cleared when value is latched by pulse signal.
-- Software needs to check if register is less than 16
-- (or 0x10) for valid key press.
-- Values of matrix are 0-15, with cable coming 
-- out from the top of the keypad.
--  ____|||||____
--  | 0| 1| 2| 3|
--  | 4| 5| 6| 7|
--  | 8| 9|10|11|
--  |12|13|14|15|

-- the original can be found at
-- http://users.senet.com.au/~dwsmith/vhdl.htm#top

-- connect strobe to drive the interrupt line?

entity keypad_controller is
  port (
    sys_clk : in std_logic; -- Clock source and
    resetn : in std_logic; -- Reset on global inputs
-- strobe : out std_logic; -- key pressed
    row : in std_logic_vector (3 downto 0); -- Sense keypad rows
    col : out std_logic_vector (3 downto 0); -- Drive columns
    shift : out std_logic_vector (31 downto 0));
end keypad_controller;

architecture keys of keypad_controller is
  signal key_pressed : std_logic; -- High when a key pressed
  signal NKP : std_logic;
  signal latch_n : std_logic; -- PH added to send changes to software
  signal mat : std_logic_vector (3 downto 0); -- key conversion matrix
  signal d : unsigned(3 downto 0); -- Control counter
  signal cnt : unsigned (1 downto 0); -- used in key debounce
  signal divider : unsigned(15 downto 0);
                                        -- used for keypad scan clock generation
  signal clk : std_logic; -- internal clk
  signal pulse : std_logic;
  signal inp0 : std_logic_vector(3 downto 0);

begin

  -- Scan the keyboard until a key is pressed
  process (clk, key_pressed, resetn)
  begin
    if (clk'event and clk = '1') then
      if (resetn = '0') then
        d <= "0000"; -- synchronous reset
      else
        if (key_pressed = '0') then
          d <= d + 1;
        end if;
      end if; -- Counter stops counting when a key is pressed
    end if;
  end process;

  -- Column drivers, active low

  col(0) <= '0' when d(3 downto 2) = "00" else '1';
  col(1) <= '0' when d(3 downto 2) = "01" else '1';
  col(2) <= '0' when d(3 downto 2) = "10" else '1';
  col(3) <= '0' when d(3 downto 2) = "11" else '1';

  -- Sense keyboard rows with a multiplexer
  -- double inversion ughh
  -- keypad gives 0 when key pressed
  
  -- PH modified the matrix so keypad can be upside down

with d select
  mat <=          -- button, col, row
  "0000" when "0011", -- 0  -- 0, 3
  "0001" when "0111", -- 1  -- 1, 3
  "0010" when "1011", -- 2  -- 2, 3
  "0011" when "1111", -- 3  -- 3, 3
  "0100" when "0010", -- 4  -- 0, 2
  "0101" when "0110", -- 5  -- 1, 2
  "0110" when "1010", -- 6  -- 2, 2
  "0111" when "1110", -- 7  -- 3, 2
  "1000" when "0001", -- 8  -- 0, 1
  "1001" when "0101", -- 9  -- 1, 1
  "1010" when "1001", -- 10 -- 2, 1
  "1011" when "1101", -- 11 -- 3, 1
  "1100" when "0000", -- 12 -- 0, 0
  "1101" when "0100", -- 13 -- 1, 0
  "1110" when "1000", -- 14 -- 2, 0
  "1111" when "1100", -- 15 -- 3, 0
  "0000" when others;
  
  with d(1 downto 0) select
    key_pressed <= not row(3) when "11",
                   not row(2) when "10",
                   not row(1) when "01",
                   not row(0) when others;

  NKP <= not key_pressed;

  -- Generate strobe when key press has settled
  -- st : debounce port map(clk, NKP, strobe);
  -- below is hacked process from debounce module

  process (clk, NKP, pulse)
  begin
    if NKP = '1' then
      cnt <= to_unsigned(0, 2);
    else
      if (clk'event and clk = '1') then
        if (cnt /= to_unsigned(3, 2)) then
          cnt <= cnt + to_unsigned(1, 2);
        end if;
      end if;
      if (cnt = to_unsigned(2, 2)) and (NKP = '0') then
        pulse <= '1';
      else
        pulse <= '0';
      end if;

    end if;
  end process;
  
  
  -- PH 21/03/2012 added latch_n to indicate No Key Pressed in sw.
  process (NKP, pulse, latch_n)
  begin
    if (NKP = '0') then
	     if pulse = '1' then -- only set latch when pulse is received
          latch_n <= '0';
        end if;
    else
		latch_n <= '1';
    end if;
  end process;
  
-- latch key value (from matrix) when we get a pulse
  process (clk,resetn,pulse,mat)
  begin
    if resetn = '0' then -- asynchronous clear
      inp0 <= "0000";
    else
      if (clk'event and clk = '1') then
        if pulse = '1' then -- left shift mat into shift register
          inp0 <= mat;
        end if;
      end if;
    end if;
  end process;

  -- shift is padded to 32 bits to keep sopc_builder happy ;-) NJG
  
  -- PH 28/02/2012 added NKP and pulse into the shift register
  -- NKP indicates when no key is pressed
  -- pulse indicates that inp0 is the latched value
-- shift <= "00000000000000000000000000"&NKP&pulse&inp0;

  -- PH 29/02/2012 keeping as just inp0 for strobe interrupt
-- shift <= "0000000000000000000000000000"&inp0;
  -- PH added strobe to drive interrupt line
-- strobe <= pulse;


  -- PH 11/03/2012 changed NKP & pulse to latch_n
  --  due to bug. NKP is set before value is latched, and pulse
  --  doesn't stay set long enough to be shown in polling sw.  
  shift <= "000000000000000000000000000"&latch_n&inp0;
  
 --shift <= inp0;

--end;


-- purpose: takes the system clock and drops it to 2mS clock
-- type : sequential
-- inputs : sys_clk, resetn
-- outputs: clk
clock_div : process (sys_clk, resetn)
begin -- process clock_div
  if resetn = '0' then -- asynchronous reset (active low)
    divider <= to_unsigned(0, 16);
    clk <= '0';
  elsif sys_clk'event and sys_clk = '1' then -- rising clock edge
    if divider = X"8235" then
      clk <= not clk;
      divider <= to_unsigned(0, 16);
    else
      divider <= divider + to_unsigned(1, 16);
    end if;

  end if;
end process clock_div;

end;

