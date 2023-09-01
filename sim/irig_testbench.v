`timescale 1 ns / 100 ps

module irig_testbench();
    
    localparam MARK = 3'b100;
    localparam D1 = 3'b010;
    localparam D0 = 3'b001;

    // Inputs to the DUT
    reg clk;
    reg rst;
    reg irigb;
    reg sys_clk250 = 1'b0;
 
    // Output of the DUT
    wire pps;    
    wire [5:0] ts_second;
    wire [5:0] ts_minute;
    wire [4:0] ts_hour;
    wire [8:0] ts_day;
    wire [6:0] ts_year;
    wire [16:0] ts_sec_day;
    wire [3:0] state;
    
   irig_intfc i_irig_intfc (
    .clk_in                (sys_clk250),
      .rst_in              (rst),
      .irigb_in            (irigb),
      .pps_out             (pps),
      .ts_second_out       (ts_second),
      .ts_minute_out       (ts_minute),
      .ts_hour_out         (ts_hour),
      .ts_day_out          (ts_day),
      .ts_year_out         (ts_year),
      .ts_sec_day_out      (ts_sec_day)
      );

            
    // Reset
    initial begin
        clk = 1'b0;
        irigb = 1'b0;
        rst = 1'b1;
        
        // Reset goes low
        #120 rst = 1'b0;        
        #100;

        // Some garbage bits
        irig_bit(D0);
        irig_bit(MARK);
        irig_bit(D1);
        irig_bit(D0);

        // End of second
        irig_bit(MARK);

        // Now send a full stream
        irig_timestamp();

        // Break the lock
//        irig_bit(D1);

//        // Now reestablish the lock
//        irig_bit(MARK);
//        irig_bit(MARK);

        // Now send a full stream
        irig_timestamp1();

        // Now send a full stream
        irig_timestamp();

        $stop;
    end

    always
      #50 clk = ~clk;    // 10 MHz

    always
      #2  sys_clk250 = ~sys_clk250;  // 250 MHz


    // Send a full timestamp
    task irig_timestamp;        
        begin
            // Frame identifier
            irig_bit(MARK); // 00

            // Seconds: 42 = 100_0010
            // only 8 bits here
            irig_bitstream(9'bx10000010);

            // Minutes: 59 = _101_1001
            irig_bit(MARK); // 09
            irig_bitstream(9'b010101001);
            
            // Hours: 17 = __01_0111
            irig_bit(MARK); // 19
            irig_bitstream(9'b000100111);

            // Day of year 293 (93) = 1001_0011 
            irig_bit(MARK); // 29
            irig_bitstream(9'b100100011);

            // Day of year 293 (2) = _______10
            // Tenth of seconds unused
            irig_bit(MARK); // 39
            irig_bitstream(9'b000000010);

            // Year 16 = 0001_0110
            irig_bit(MARK); // 49
            irig_bitstream(9'b000100110);

            // Unused
            irig_bit(MARK); // 59
            irig_bitstream(9'b0);
            irig_bit(MARK); // 69
            irig_bitstream(9'b0);

            // Seconds in day
            // 17:59:42 = 64782 = _01111110100001110
            irig_bit(MARK); // 79
            irig_bitstream(9'b100001110);
            irig_bit(MARK); // 89
            irig_bitstream(9'b001111110);
            irig_bit(MARK); // 99            
          end
    endtask // irig_timestamp

    // Send another full timestamp
    task irig_timestamp1;        
        begin
            // Frame identifier
            irig_bit(MARK); // 00

            // Seconds: 25 = 010_0101
            // only 8 bits here
            irig_bitstream(9'bx01000101);

            // Minutes: 36 = _011_0110
            irig_bit(MARK); // 09
            irig_bitstream(9'b001100110);
            
            // Hours: 13 = __01_0011
            irig_bit(MARK); // 19
            irig_bitstream(9'b000100011);

            // Day of year 353 (93) = 0101_0011 
            irig_bit(MARK); // 29
            irig_bitstream(9'b010100011);

            // Day of year 393 (3) = _______11
            // Tenth of seconds unused
            irig_bit(MARK); // 39
            irig_bitstream(9'b000000011);

            // Year 45 = 0100_0101
            irig_bit(MARK); // 49
            irig_bitstream(9'b010000101);

            // Unused
            irig_bit(MARK); // 59
            irig_bitstream(9'b0);
            irig_bit(MARK); // 69
            irig_bitstream(9'b0);

            // Seconds in day
            // 17:59:42 = 25698 = _00110010 001100010
            irig_bit(MARK); // 79
            irig_bitstream(9'b001100010);
            irig_bit(MARK); // 89
            irig_bitstream(9'b000110010);
            irig_bit(MARK); // 99            
          end
    endtask // irig_timestamp

    // Send a stream of IRIG bits
    // 'x' means skip completely FIX ME?
    task irig_bitstream;
        input [8:0] s;
        begin
        repeat (9) 
          begin
            case (s[0])
              1'b1:
                irig_bit(D1);
              1'b0:
                irig_bit(D0);
            endcase // case (s[0])
            s = s >> 1'b1;
          end 
        end
    endtask
              
    // Send a single width-encoded bit
    task irig_bit;
        input [2:0] ib; // mark, 1, 0
        begin
            @(posedge clk);
            irigb = 1'b1;
            case (ib)
              D0: 
                begin
                    #2000500 irigb = 1'b0;
                    #7999500;
                end
              D1:
                begin
                    #5000500 irigb = 1'b0;
                    #4999500;
                end
              MARK:
                begin 
                    #8000500 irigb = 1'b0;
                    #1999500;
                end
            endcase            
        end
    endtask

endmodule