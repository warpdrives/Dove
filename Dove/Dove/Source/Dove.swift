//  Dove
//
//  Dove.swift
//
//  Copyright (c) 2020-Present Warpdrives Team - https://github.com/warpdrives
//
//  The software is available under the Apache 2.0 license. See the LICENSE file
//  for more info.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//  Created by ShevaKuilin on 2020/10/30.
//  Copyright © 2020 Warpdrives Team. All rights reserved.
//

import UIKit

private struct Pool {
    var reusablePool: Set<UIView>!  // Reuse pool
    var visiablePool: Set<UIView>!  // Visible pool
}

private struct SidebarValues {
    var row: Int
    var column: Int
    var rowValues: [String]
    var columnValues: [String]
}

public enum DoveSidebarType { /// Sidebar type
    case rowLetters     /// Row letter, column number
    case columLetters   /// Row number, column letter
    case numbers        /// Pure numbers
    case letters        /// Pure letters
    case custom         /// Customize   NOTE: Need to overload the 'open func convert(_ sidebarType: DoveSidebarType) -> ([String], [String])' method
}

public class Dove: UIView {
    private lazy var containScrollView = UIScrollView()
    
    private lazy var pool = Pool()
    private lazy var sidebarValues = SidebarValues(row: 0, column: 0, rowValues: [], columnValues: [])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Convert enum to tuple
    /// - Parameter:    sidebarType     Sidebar type
    /// - Return:          Tuple of row and column values
    open func convert(_ sidebarType: DoveSidebarType = .rowLetters) -> ([String], [String]) {
        switch sidebarType {
        case .rowLetters: break
        case .columLetters: break
        case .numbers: break
        case .letters: break
        case .custom: break
        }
        return (["1"], ["2"])
    }
}

public extension Dove {
    func set(_ row: Int, _ column: Int, _ sidebarType: DoveSidebarType = .rowLetters) {
        let rowColumnValues = convert(sidebarType)
        sidebarValues = SidebarValues(row: row,
                                      column: column,
                                      rowValues: rowColumnValues.0,
                                      columnValues: rowColumnValues.1)
    }
}

private extension Dove {
    private func initElements() {
        containScrollView.frame = self.bounds
        containScrollView.backgroundColor = self.backgroundColor
        containScrollView.showsVerticalScrollIndicator = false
        containScrollView.showsHorizontalScrollIndicator = false
        containScrollView.delegate = self
        self.addSubview(containScrollView)
    }
}

// Mark: UIScrollViewDelegate

extension Dove: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
