"""Logger module."""
import logging
import os
from logging import handlers

filename = "lus.log"
path = os.path.join("c:", os.sep, "Licensing", "lus", filename)

LOG_LEVEL = os.getenv("LOG_LEVEL", "WARNING").upper()
log = logging.getLogger("lus")
fmt = logging.Formatter(
    "%(asctime)s - [%(name)s][%(levelname)s]msg: %(message)s",
    datefmt="%Y-%m-%dT%H:%M:%S%z",
)


def get_logger(logfile=path):
    """Set a default configured logger."""
    fh = handlers.RotatingFileHandler(
        logfile,
        maxBytes=10485760,
        backupCount=200,
    )
    fh.setLevel(LOG_LEVEL)
    fh.setFormatter(fmt)
    log.addHandler(fh)
    return log
