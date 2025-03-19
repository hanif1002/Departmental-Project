# Variable DC Power Supply

## Overview
This project is a **variable DC power supply** designed and simulated in Proteus. It converts 240V AC input into an adjustable DC output with voltage regulation, current monitoring, and protection features. The circuit includes LED indicators for status monitoring and a user-adjustable voltage control.

---

## Features
- **Input Voltage:** 240V AC
- **Adjustable DC Output:** User-controlled voltage adjustment
- **LED Status Indicators:** Red and Green LEDs for fault and normal operation
- **Short Circuit Protection:** Prevents damage during faults
- **Voltage Regulation:** Ensures stable output voltage
- **Current Monitoring:** Monitors output current for safety
- **Push Button Control:** Manual control of the output

---

## Components
### Active Components
- LM317T (Adjustable Voltage Regulator)
- 7808 (Fixed 8V Regulator)
- 7815 (Fixed 15V Regulator)
- LM358 (Dual Op-Amp)
- 2N2222A (NPN Transistors)

### Passive Components
- Bridge Rectifier (BR2)
- Capacitors (1μF, 2200μF)
- Resistors (10k, 240Ω, 1k, 4.2k, etc.)
- Potentiometer (10k)

### Indicators and Protection
- LEDs (Red/Green)
- Zener Diodes (1N4735A)
- Relays (5V)

---

## Proteus Simulation
1. Open the provided `.DSN` file in Proteus ISIS Professional.
2. Configure simulation settings:
   - **Run Time:** Continuous
   - **Step Time:** 0.1ms
   - **Analysis:** Transient
3. Run the simulation and observe the output voltage and LED behavior.

---

## PCB Design
The PCB layout (`.LYT` file) follows these guidelines:
- **Layers:** 2-layer board
- **Trace Widths:** 20mil (power), 10mil (signal)
- **Component Clearance:** 0.3mm minimum
- **Ground Plane:** Bottom layer

---

## Usage
1. Connect 240V AC to the input terminals.
2. Adjust the potentiometer (RV1) to set the desired output voltage.
3. Monitor the LEDs:
   - **Green LED:** Normal operation
   - **Red LED:** Fault condition
4. Use the push button to enable/disable the output.

---

## Safety Precautions
- **High Voltage Warning:** Handle the input stage with care.
- **Isolation:** Ensure proper isolation between high and low voltage sections.
- **Heat Management:** Use heat sinks for voltage regulators.

---

## Troubleshooting
- **No Output:** Check input power, bridge rectifier, and regulators.
- **Unstable Output:** Inspect filter capacitors and feedback circuit.
- **LEDs Not Working:** Verify polarity, resistors, and transistor drivers.

---

## Future Enhancements
1. Add a digital voltage display.
2. Implement adjustable current limiting.
3. Integrate temperature monitoring.
4. Provide multiple output voltage ranges.
5. Add a digital control interface.
