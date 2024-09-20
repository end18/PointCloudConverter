﻿namespace PointCloudConverterForDotnetCLI
{
    public struct PointCloudTile
    {
        public float minX;
        public float minY;
        public float minZ;
        public float maxX;
        public float maxY;
        public float maxZ;

        public float centerX;
        public float centerY;
        public float centerZ;

        public int totalPoints;
        public int loadedPoints;
        public int visiblePoints;

        public string fileName;

        // cell min edge
        public int cellX;
        public int cellY;
        public int cellZ;

        // average timestamp from all points in this tile
        public double averageTimeStamp;
        public float overlapRatio; // 0-1, 0 means no overlap, 1 means full overlap

    }
}
