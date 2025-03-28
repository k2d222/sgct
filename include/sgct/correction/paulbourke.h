/*****************************************************************************************
 * SGCT                                                                                  *
 * Simple Graphics Cluster Toolkit                                                       *
 *                                                                                       *
 * Copyright (c) 2012-2022                                                               *
 * For conditions of distribution and use, see copyright notice in LICENSE.md            *
 ****************************************************************************************/

#ifndef __SGCT__CORRECTION_PAULBOURKE__H__
#define __SGCT__CORRECTION_PAULBOURKE__H__

#include <sgct/math.h>
#include <sgct/correction/buffer.h>
#include <string>

namespace sgct::correction {

Buffer generatePaulBourkeMesh(const std::string& path, const vec2& pos, const vec2& size,
    float aspectRatio);

} // namespace sgct::correction

#endif // __SGCT__CORRECTION_PAULBOURKE__H__
