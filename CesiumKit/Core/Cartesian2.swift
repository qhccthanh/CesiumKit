//
//  Cartesian2.swift
//  CesiumKit
//
//  Created by Ryan Walklin on 11/06/14.
//  Copyright (c) 2014 Test Toast. All rights reserved.
//

import Foundation
import simd

/**
* A 2D Cartesian point.
* @alias Cartesian2
* @constructor
*
* @param {Number} [x=0.0] The X component.
* @param {Number} [y=0.0] The Y component.
*
* @see Cartesian3
* @see Cartesian4
* @see Packable
*/

public typealias Cartesian2 = double2

public extension Cartesian2 {
    
    /**
    * Creates a Cartesian2 instance from an existing Cartesian3.  This simply takes the
    * x and y properties of the Cartesian3 and drops z.
    * @function
    *
    * @param {Cartesian3} cartesian The Cartesian3 instance to create a Cartesian2 instance from.
    * @param {Cartesian2} [result] The object onto which to store the result.
    * @returns {Cartesian2} The modified result parameter or a new Cartesian2 instance if one was not provided.
    */
    init (fromCartesian3 cartesian3: Cartesian3) {
        self.init(cartesian3.x, cartesian3.y)
    }
    
    /**
    * Creates a Cartesian2 instance from an existing Cartesian4.  This simply takes the
    * x and y properties of the Cartesian4 and drops z and w.
    * @function
    *
    * @param {Cartesian4} cartesian The Cartesian4 instance to create a Cartesian2 instance from.
    * @param {Cartesian2} [result] The object onto which to store the result.
    * @returns {Cartesian2} The modified result parameter or a new Cartesian2 instance if one was not provided.
    */
    init (fromCartesian4 cartesian4: Cartesian4) {
        self.init(cartesian4.x, cartesian4.y)
    }
    
    
    /**
    * Computes the value of the maximum component for the supplied Cartesian.
    *
    * @param {Cartesian2} cartesian The cartesian to use.
    * @returns {Number} The value of the maximum component.
    */
    func maximumComponent() -> Double {
        return reduce_max(self)
    }
    
    /**
    * Computes the value of the minimum component for the supplied Cartesian.
    *
    * @param {Cartesian2} cartesian The cartesian to use.
    * @returns {Number} The value of the minimum component.
    */
    func minimumComponent() -> Double {
        return reduce_min(self)
    }
    
    /**
    * Compares two Cartesians and computes a Cartesian which contains the minimum components of the supplied Cartesians.
    *
    * @param {Cartesian2} first A cartesian to compare.
    * @param {Cartesian2} second A cartesian to compare.
    * @param {Cartesian2} [result] The object into which to store the result.
    * @returns {Cartesian2} A cartesian with the minimum components.
    */
    func minimumByComponent(other: Cartesian2) -> Cartesian2 {
        return min(self, other)
    }
    
    /**
    * Compares two Cartesians and computes a Cartesian which contains the maximum components of the supplied Cartesians.
    *
    * @param {Cartesian2} first A cartesian to compare.
    * @param {Cartesian2} second A cartesian to compare.
    * @param {Cartesian2} [result] The object into which to store the result.
    * @returns {Cartesian2} A cartesian with the maximum components.
    */
    func maximumByComponent(other: Cartesian2) -> Cartesian2 {
        return max(self, other)
    }
    /**
    * Computes the provided Cartesian's squared magnitude.
    *
    * @param {Cartesian2} cartesian The Cartesian instance whose squared magnitude is to be computed.
    * @returns {Number} The squared magnitude.
    */
    func magnitudeSquared() -> Double {
        return x * x + y * y
    }
    
    /**
    * Computes the Cartesian's magnitude (length).
    *
    * @param {Cartesian2} cartesian The Cartesian instance whose magnitude is to be computed.
    * @returns {Number} The magnitude.
    */
    func magnitude() -> Double {
        return sqrt(magnitudeSquared())
    }
    
    
    /**
    * Computes the distance between two points.
    *
    * @param {Cartesian2} left The first point to compute the distance from.
    * @param {Cartesian2} right The second point to compute the distance to.
    * @returns {Number} The distance between two points.
    *
    * @example
    * // Returns 1.0
    * var d = Cesium.Cartesian2.distance(new Cesium.Cartesian2(1.0, 0.0), new Cesium.Cartesian2(2.0, 0.0));
    */
    public func distance(other: Cartesian2) -> Double {
        return simd.distance(self, other)
    }
    
    /**
    * Computes the squared distance between two points.  Comparing squared distances
    * using this function is more efficient than comparing distances using {@link Cartesian2#distance}.
    *
    * @param {Cartesian2} left The first point to compute the distance from.
    * @param {Cartesian2} right The second point to compute the distance to.
    * @returns {Number} The distance between two points.
    *
    * @example
    * // Returns 4.0, not 2.0
    * var d = Cesium.Cartesian2.distance(new Cesium.Cartesian2(1.0, 0.0), new Cesium.Cartesian2(3.0, 0.0));
    */
    func distanceSquared (other: Cartesian2) -> Double {
        return distance_squared(self, other)
    }

    /**
    * Computes the normalized form of the supplied Cartesian.
    *
    * @param {Cartesian2} cartesian The Cartesian to be normalized.
    * @param {Cartesian2} [result] The object onto which to store the result.
    * @returns {Cartesian2} The modified result parameter or a new Cartesian2 instance if one was not provided.
    */
    func normalize() -> Cartesian2 {
        return simd.normalize(self)
    }
    
    /**
    * Computes the dot (scalar) product of two Cartesians.
    *
    * @param {Cartesian2} left The first Cartesian.
    * @param {Cartesian2} right The second Cartesian.
    * @returns {Number} The dot product.
    */
    func dot(other: Cartesian2) -> Double {
        return simd.dot(self, other)
    }
    
    /**
    * Computes the absolute value of the provided Cartesian.
    *
    * @param {Cartesian2} cartesian The Cartesian whose absolute value is to be computed.
    * @param {Cartesian2} [result] The object onto which to store the result.
    * @returns {Cartesian2} The modified result parameter or a new Cartesian2 instance if one was not provided.
    */
    func absolute() -> Cartesian2 {
        return abs(self)
    }
    
    /**
    * Computes the linear interpolation or extrapolation at t using the provided cartesians.
    *
    * @param {Cartesian2} start The value corresponding to t at 0.0.
    * @param {Cartesian2} end The value corresponding to t at 1.0.
    * @param {Number} t The point along t at which to interpolate.
    * @param {Cartesian2} [result] The object onto which to store the result.
    * @returns {Cartesian2} The modified result parameter or a new Cartesian2 instance if one was not provided.
    */
    func lerp(end: Cartesian2, t: Double) -> Cartesian2 {
        return mix(self, end, t: t)
    }
    
    /**
    * Returns the angle, in radians, between the provided Cartesians.
    *
    * @param {Cartesian2} left The first Cartesian.
    * @param {Cartesian2} right The second Cartesian.
    * @returns {Number} The angle between the Cartesians.
    */
    func angleBetween(other: Cartesian2) -> Double {
        return Math.acosClamped(normalize().dot(other.normalize()))
    }
    
    /**
    * Returns the axis that is most orthogonal to the provided Cartesian.
    *
    * @param {Cartesian2} cartesian The Cartesian on which to find the most orthogonal axis.
    * @param {Cartesian2} [result] The object onto which to store the result.
    * @returns {Cartesian2} The most orthogonal axis.
    */
    func mostOrthogonalAxis() -> Cartesian2 {
        
        let f = normalize().absolute()
        var result: Cartesian2
        
        if (f.x <= f.y) {
            result = Cartesian2.unitX
        } else {
            result = Cartesian2.unitY
        }
        return result
    }
    
    func equalsArray (array: [Float], offset: Int) -> Bool {
        return Float(x) == array[offset] && Float(y) == array[offset + 1]
    }
    
    /**
    * Compares the provided Cartesians componentwise and returns
    * <code>true</code> if they pass an absolute or relative tolerance test,
    * <code>false</code> otherwise.
    *
    * @param {Cartesian2} [left] The first Cartesian.
    * @param {Cartesian2} [right] The second Cartesian.
    * @param {Number} relativeEpsilon The relative epsilon tolerance to use for equality testing.
    * @param {Number} [absoluteEpsilon=relativeEpsilon] The absolute epsilon tolerance to use for equality testing.    
    * @returns {Boolean} <code>true</code> if left and right are within the provided epsilon, <code>false</code> otherwise.
    */
    func equalsEpsilon(other: Cartesian2, relativeEpsilon: Double, absoluteEpsilon: Double? = nil) -> Bool {
        return self == other ||
                (Math.equalsEpsilon(self.x, other.x, relativeEpsilon: relativeEpsilon, absoluteEpsilon: absoluteEpsilon) &&
                Math.equalsEpsilon(self.y, other.y, relativeEpsilon: relativeEpsilon, absoluteEpsilon: absoluteEpsilon))
    }
    
    /**
    * An immutable Cartesian2 instance initialized to (0.0, 0.0).
    *
    * @type {Cartesian2}
    * @constant
    */
    static let zero = Cartesian2()
    
    /**
    * An immutable Cartesian2 instance initialized to (1.0, 0.0).
    *
    * @type {Cartesian2}
    * @constant
    */
    static let unitX = Cartesian2(x: 1.0, y: 0.0)
    
    /**
    * An immutable Cartesian2 instance initialized to (0.0, 1.0).
    *
    * @type {Cartesian2}
    * @constant
    */
    static let unitY = Cartesian2(x: 1.0, y: 0.0)
}

extension Cartesian2: CartesianType {}

extension Cartesian2: UniformSourceType {
    
    var simdType: SIMDType {
        return vector_float(self)
    }
}

extension Cartesian2: Packable {
    
    /**
     * The number of elements used to pack the object into an array.
     * @type {Number}
     */
    static func packedLength () -> Int {
        return 2
    }
    
    init(fromArray array: [Double], startingIndex: Int = 0) {
        self.init()
        assert(checkPackedArrayLength(array, startingIndex: startingIndex), "Invalid packed array length")
        array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<Double>) in
            memcpy(&self, pointer.baseAddress, Cartesian2.packedLength() * strideof(Double))
        }
    }
}

/**
* Compares the provided Cartesians componentwise and returns
* <code>true</code> if they are equal, <code>false</code> otherwise.
*
* @param {Cartesian2} [left] The first Cartesian.
* @param {Cartesian2} [right] The second Cartesian.
* @returns {Boolean} <code>true</code> if left and right are equal, <code>false</code> otherwise.
*/
public func == (left: Cartesian2, right: Cartesian2) -> Bool {
    return (left.x == right.x) && (left.y == right.y)
}


