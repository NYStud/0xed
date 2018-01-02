#pragma once
#include "base.h"

// TODO: replace this with ImRect
struct Rect
{
    f32 x, y, w, h;
};

#define PANEL_MAX_COUNT 5

struct DataPanels
{
    enum {
        PT_HEX = 0,
        PT_ASCII,

        PT_INT8,
        PT_UINT8,
        PT_INT16,
        PT_UINT16,
        PT_INT32,
        PT_UINT32,
        PT_INT64,
        PT_UINT64,
    };

    Rect panelRect[PANEL_MAX_COUNT];
    i32 panelType[PANEL_MAX_COUNT];
    i32 panelCount = 3;

    u8* data;
    i64 dataSize;

    const i32 columnCount = 16;
    const i32 columnWidth = 22;
    const i32 columnHeaderHeight = 20;
    const i32 rowHeight = 22;
    const i32 rowHeaderWidth = 22;
    i32 rowCount = 100;

    const i32 scrollbarWidth = 20;

    struct ImFont* fontMono;

    DataPanels();
    void doUi(const Rect& viewRect);

    void doHexPanel(const Rect& panelRect, const i32 startLine);
    void doAsciiPanel(const Rect& panelRect, const i32 startLine);
    void doIntegerPanel(const Rect& panelRect, const i32 startLine, i32 bitSize, bool isSigned);
};
