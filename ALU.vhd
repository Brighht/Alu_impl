library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is 
	port(
		operand_1 : in std_logic_vector(3 downto 0);
		operand_2 : in std_logic_vector(3 downto 0);
		output : out std_logic_vector(3 downto 0);
		zero     : out std_logic; -- result is all zeros
		carry    : out std_logic; -- arithmetic overflow out of the MSB
		negative : out std_logic; -- result's MSB is 1 (signed interpretation)
		sel : in std_logic_vector(2 downto 0)
	);
end alu;

architecture behavorial of alu is
	signal full_result : std_logic_vector(4 downto 0);
	signal operation_res : std_logic_vector(3 downto 0);
	begin
		process(operand_1, operand_2, sel)
		begin
			case sel is
				when "000" => 
					full_result <= std_logic_vector(unsigned("0" & operand_1) + unsigned("0" & operand_2));
				when others =>
					full_result <= (others => '0'); -- default case required!
			end case;
		end process;
		carry <= full_result(4);
		operation_res <= full_result(3 downto 0);
		output <= operation_res;
		
end behavorial;