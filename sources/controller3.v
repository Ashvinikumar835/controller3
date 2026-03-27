`timescale 1ns / 1ps

module controller3 (
    input              clk,
    input              rst_n,

    // CPU interface
    input              req_valid,
    input              req_rw,        // 0 = read, 1 = write
    input      [31:0]  req_addr,
    input      [31:0]  req_wdata,

    output reg         resp_valid,
    output reg [31:0]  resp_rdata,

    // Memory interface
    output reg         mem_req_valid,
    output reg         mem_req_rw,    // 0 = read, 1 = write
    output reg [31:0]  mem_addr,
    output reg [31:0]  mem_wdata,

    input              mem_ready,
    input      [31:0]  mem_rdata
);

    // =========================
    // STATE DEFINITIONS
    // =========================
    localparam IDLE         = 4'd0;
    localparam TAG_LOOKUP   = 4'd1;
    localparam READ_HIT     = 4'd2;
    localparam WRITE_HIT    = 4'd3;
    localparam MISS_HANDLE  = 4'd4;
    localparam WRITEBACK    = 4'd5;
    localparam ALLOCATE     = 4'd6;
    localparam REFILL       = 4'd7;
    localparam RESPOND      = 4'd8;

    reg [3:0] state, next_state;

    // =========================
    // CACHE METADATA (simple)
    // =========================
    reg        valid;
    reg        dirty;
    reg [19:0] tag;
    reg [31:0] data;

    wire [19:0] req_tag;
    assign req_tag = req_addr[31:12];

//internal logic

endmodule
