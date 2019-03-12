unit FileIcon;

interface

uses ShellApi;

type
  TICONDIRENTRY = packed record
    bWidth: Byte;          // Width, in pixels, of the image
    bHeight: Byte;         // Height, in pixels, of the image
    bColorCount: Byte;     // Number of colors in image (0 if >=8bpp)
    bReserved: Byte;       // Reserved ( must be 0)
    wPlanes: Word;         // Color Planes
    wBitCount: Word;       // Bits per pixel
    dwBytesInRes: DWORD;   // How many bytes in this resource?
    dwImageOffset: DWORD;  // Where in the file is this image?
  end;

  TICONDIR = packed record
    idReserved: Word; // Reserved (must be 0)
    idType: Word;     // Resource Type (1 for icons)
    idCount: Word;    // How many images?
    idEntries: array [0..255] of TICONDIRENTRY;
  end;
  PICONDIR=^TICONDIR;

// When Icon is bound into a EXE or DLL file then structure members are WORD
// aligned and the last member of the ICONDIRENTRY structure is the ID instead of
// the imageoffset.

  TMEMICONDIRENTRY = record
    bWidth: Byte;               // Width of the image
    bHeight: Byte;              // Height of the image (times 2)
    bColorCount: Byte;          // Number of colors in image (0 if >=8bpp)
    bReserved: Byte;            // Reserved
    wPlanes: Integer;           // Color Planes
    wBitCount: Integer;         // Bits per pixel
    dwBytesInRes: Long;         // how many bytes in this resource?
    nID: Integer;               // the ID
  end;

implementation

end.
