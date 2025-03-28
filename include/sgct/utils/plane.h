/*****************************************************************************************
 * SGCT                                                                                  *
 * Simple Graphics Cluster Toolkit                                                       *
 *                                                                                       *
 * Copyright (c) 2012-2022                                                               *
 * For conditions of distribution and use, see copyright notice in LICENSE.md            *
 ****************************************************************************************/

#ifndef __SGCT__PLANE__H__
#define __SGCT__PLANE__H__

/**
 * \namespace sgct::utils
 * \brief SGCT utils namespace contains basic utilities for geometry rendering
*/
namespace sgct::utils {

/// This class creates and renders a textured box.
class Plane {
public:
    /// This constructor requires a valid OpenGL contex
    Plane(float width, float height);
    ~Plane();

    void draw();

private:
    unsigned int _vao = 0;
    unsigned int _vbo = 0;
};

} // namespace sgct::utils

#endif // __SGCT__PLANE__H__
