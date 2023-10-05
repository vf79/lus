"""License User Statistic Main."""
from scapy.all import sniff

from lus.logger import get_logger

log = get_logger()


def writelog(packet):
    """Write log."""
    msg = str(packet.answers)
    log.warning(msg=msg)


def main():
    """Run app."""
    filter = "port 5500"
    sniff(filter=filter, prn=writelog, store=0)


if __name__ == "__main__":
    main()
