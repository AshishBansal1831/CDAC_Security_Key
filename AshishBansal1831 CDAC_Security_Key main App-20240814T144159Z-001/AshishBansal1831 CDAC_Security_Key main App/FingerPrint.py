import os
import sys
import serial

# Serial port configuration
SERIAL_PORT = '/dev/ttyUSB0'  # Replace with your serial port
BAUD_RATE = 115200

# Create a pipe
r, w = os.pipe()

# Fork the process
pid = os.fork()

if pid > 0:  # Parent process
    # Close the read end of the pipe
    os.close(r)
    
    # Initialize serial port
    ser = serial.Serial(
        port=SERIAL_PORT,
        baudrate=BAUD_RATE,
        timeout=1  # Timeout for read operations
    )

    def receive_and_send():
        while True:
            # Read 8 bytes from the serial port
            received_data = ser.read(8)
            
            if len(received_data) == 8:
                # Write the data to the pipe
                os.write(w, received_data)
                print(f"Sent to pipe: {received_data.hex()}")
            else:
                print("Did not receive 8 bytes of data.")

    try:
        receive_and_send()
    except KeyboardInterrupt:
        print("Exiting...")
    finally:
        ser.close()
        os.close(w)

else:  # Child process
    # Close the write end of the pipe
    os.close(w)
    
    # Redirect the read end of the pipe to stdin
    os.dup2(r, sys.stdin.fileno())
    
    # Execute the receiver script
    # os.execlp("python3", "python3", "receiver.py")
