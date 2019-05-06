local BlockConfig = commonlib.gettable("Mod.ParaXExporter.BlockConfig");

BlockConfig.g_regionBlockDimX = 512;
BlockConfig.g_regionBlockDimY = 256;
BlockConfig.g_regionBlockDimZ = 512;
BlockConfig.g_chunkBlockDim = 16;
BlockConfig.g_chunkBlockCount = 16 * 16 * 16;
BlockConfig.g_regionChunkDimX = BlockConfig.g_regionBlockDimX / BlockConfig.g_chunkBlockDim;
BlockConfig.g_regionChunkDimY = BlockConfig.g_regionBlockDimY / BlockConfig.g_chunkBlockDim;
BlockConfig.g_regionChunkDimZ = BlockConfig.g_regionBlockDimZ / BlockConfig.g_chunkBlockDim;
BlockConfig.g_regionChunkCount = BlockConfig.g_regionChunkDimX * BlockConfig.g_regionChunkDimY * BlockConfig.g_regionChunkDimZ;
BlockConfig.g_maxFaceCountPerBatch = 9000;
BlockConfig.g_regionBlockDimZ = 512;
BlockConfig.g_maxValidLightValue = 127;
BlockConfig.g_sunLightValue = 0xf;
BlockConfig.g_maxLightValue = 0xf;
BlockConfig.g_regionSize = 533.3333;
BlockConfig.g_chunkSize = BlockConfig.g_regionSize / BlockConfig.g_regionChunkDimX;
BlockConfig.g_dBlockSize = BlockConfig.g_regionSize / BlockConfig.g_regionBlockDimX;
BlockConfig.g_dBlockSizeInverse = 1.0 / BlockConfig.g_dBlockSize;
BlockConfig.g_blockSize = BlockConfig.g_dBlockSize;
BlockConfig.g_half_blockSize = BlockConfig.g_blockSize*0.5;