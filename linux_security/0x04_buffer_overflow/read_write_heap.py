#!/usr/bin/python3
"""
Task 0: Read and write heap memory using /proc/[PID]/mem
"""

import sys


def print_usage():
    print("Usage: sudo ./read_write_heap.py pid search_string replace_string")
    print("Example: sudo ./read_write_heap.py 1234 'Holberton' 'Hackerton'")


def main():
    if len(sys.argv) != 4:
        print_usage()
        sys.exit(1)

    pid = sys.argv[1]
    search_str = sys.argv[2]
    replace_str = sys.argv[3]

    search_bytes = search_str.encode("ascii")
    replace_bytes = replace_str.encode("ascii")

    try:
        with open(f"/proc/{pid}/maps", "r", encoding="utf-8") as maps_file:
            heap_start = None
            heap_end = None

            for line in maps_file:
                if "[heap]" in line:
                    parts = line.split()
                    addr_range = parts[0].split("-")
                    heap_start = int(addr_range[0], 16)
                    heap_end = int(addr_range[1], 16)
                    break

            if heap_start is None or heap_end is None:
                sys.exit(1)

        with open(f"/proc/{pid}/mem", "r+b") as mem_file:
            mem_file.seek(heap_start)
            heap_data = mem_file.read(heap_end - heap_start)

            offset = heap_data.find(search_bytes)

            if offset == -1:
                sys.exit(1)

            actual_addr = heap_start + offset
            payload = replace_bytes.ljust(len(search_bytes), b"\x00")

            mem_file.seek(actual_addr)
            mem_file.write(payload)

    except Exception:
        sys.exit(1)


if __name__ == "__main__":
    main()
