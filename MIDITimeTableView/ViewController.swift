//
//  ViewController.swift
//  MIDITimeTableView
//
//  Created by Cem Olcay on 14.10.2017.
//  Copyright © 2017 cemolcay. All rights reserved.
//

import UIKit

class HeaderCellView: MIDITimeTableHeaderCellView {
  var titleLabel = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }

  convenience init(title: String) {
    self.init(frame: .zero)
    commonInit()
    titleLabel.text = title
  }

  func commonInit() {
    addSubview(titleLabel)
    backgroundColor = UIColor(red: 36.0/255.0, green: 40.0/255.0, blue: 41.0/255.0, alpha: 1)
    titleLabel.textColor = UIColor(red: 216.0/255.0, green: 214.0/255.0, blue: 217.0/255.0, alpha: 1)
    titleLabel.textAlignment = .center
    titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    titleLabel.frame = CGRect(origin: .zero, size: frame.size)
  }
}

class CellView: MIDITimeTableCellView {
  var titleLabel = UILabel()
  var selectedBorderColor: UIColor = .yellow
  var defaultBorderColor: UIColor = .black

  override var isSelected: Bool {
    didSet {
      titleLabel.layer.borderColor = (isSelected ? selectedBorderColor : defaultBorderColor).cgColor
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }

  convenience init(title: String) {
    self.init(frame: .zero)
    commonInit()
    titleLabel.text = title
  }

  func commonInit() {
    backgroundColor = .clear
    addSubview(titleLabel)
    titleLabel.backgroundColor = UIColor(red: 16.0/255.0, green: 92.0/255.0, blue: 28.0/255.0, alpha: 1)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.textAlignment = .center
    titleLabel.textColor = .white
    titleLabel.layer.masksToBounds = true
    titleLabel.layer.borderColor = UIColor.black.cgColor
    titleLabel.layer.borderWidth = 1
    titleLabel.layer.cornerRadius = 5
    customMenuItems = [
      MIDITimeTableCellViewCustomMenuItem(
        title: "Custom Menu Item",
        action: #selector(didPressCustomMenuItem))
    ]
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    titleLabel.frame = CGRect(origin: .zero, size: frame.size)
  }

  @objc func didPressCustomMenuItem() {
    print("custom menu item pressed")
  }
}

class ViewController: UIViewController, MIDITimeTableViewDataSource, MIDITimeTableViewDelegate {
  @IBOutlet weak var timeTableView: MIDITimeTableView?

  var rowData: [MIDITimeTableRowData] = [
    MIDITimeTableRowData(
      cells: [
        MIDITimeTableCellData(data: "C7", position: 0, duration: 4),
        MIDITimeTableCellData(data: "Dm7", position: 4, duration: 4),
        MIDITimeTableCellData(data: "G7b5", position: 8, duration: 4),
        MIDITimeTableCellData(data: "C7", position: 12, duration: 4),
      ],
      headerCellView: HeaderCellView(title: "Chords"),
      cellView: { cellData in
        let title = cellData.data as? String ?? ""
        return CellView(title: title)
      }),

    MIDITimeTableRowData(
      cells: [
        MIDITimeTableCellData(data: "C", position: 0, duration: 1),
        MIDITimeTableCellData(data: "D", position: 4, duration: 1),
        MIDITimeTableCellData(data: "G", position: 8, duration: 1),
        MIDITimeTableCellData(data: "C", position: 12, duration: 1),
        ],
      headerCellView: HeaderCellView(title: "Bass"),
      cellView: { cellData in
        let title = cellData.data as? String ?? ""
        return CellView(title: title)
      }),

    MIDITimeTableRowData(
      cells: [
        MIDITimeTableCellData(data: "C", position: 0, duration: 1),
        MIDITimeTableCellData(data: "C", position: 1, duration: 1),
        MIDITimeTableCellData(data: "C", position: 2, duration: 1),
        MIDITimeTableCellData(data: "C", position: 3, duration: 1),

        MIDITimeTableCellData(data: "D", position: 4, duration: 1),
        MIDITimeTableCellData(data: "D", position: 5, duration: 1),
        MIDITimeTableCellData(data: "D", position: 6, duration: 1),
        MIDITimeTableCellData(data: "D", position: 7, duration: 1),

        MIDITimeTableCellData(data: "G", position: 8, duration: 1),
        MIDITimeTableCellData(data: "G", position: 9, duration: 1),
        MIDITimeTableCellData(data: "G", position: 10, duration: 1),
        MIDITimeTableCellData(data: "G", position: 11, duration: 1),

        MIDITimeTableCellData(data: "C", position: 12, duration: 1),
        MIDITimeTableCellData(data: "C", position: 13, duration: 1),
        MIDITimeTableCellData(data: "C", position: 14, duration: 1),
        MIDITimeTableCellData(data: "C", position: 15, duration: 1),
        ],
      headerCellView: HeaderCellView(title: "Melody"),
      cellView: { cellData in
        let title = cellData.data as? String ?? ""
        return CellView(title: title)
    }),

    MIDITimeTableRowData(
      cells: [
        MIDITimeTableCellData(data: "C", position: 0, duration: 0.5),
        MIDITimeTableCellData(data: "C", position: 2, duration: 0.5),

        MIDITimeTableCellData(data: "D", position: 4, duration: 0.5),
        MIDITimeTableCellData(data: "D", position: 6, duration: 0.5),

        MIDITimeTableCellData(data: "G", position: 8, duration: 0.5),
        MIDITimeTableCellData(data: "G", position: 10, duration: 0.5),

        MIDITimeTableCellData(data: "C", position: 12, duration: 0.5),
        MIDITimeTableCellData(data: "C", position: 14, duration: 0.5),
      ],
      headerCellView: HeaderCellView(title: "Synths"),
      cellView: { cellData in
        let title = cellData.data as? String ?? ""
        return CellView(title: title)
    })
  ]

  override func viewDidLoad() {
    super.viewDidLoad()

    timeTableView?.dataSource = self
    timeTableView?.timeTableDelegate = self
    timeTableView?.gridLayer.showsSubbeatLines = false
    timeTableView?.reloadData()
    
    timeTableView?.backgroundColor = UIColor(red: 18.0/255.0, green: 20.0/255.0, blue: 19.0/255.0, alpha: 1)
    timeTableView?.measureView.backgroundColor = UIColor(red: 26.0/255.0, green: 28.0/255.0, blue: 27.0/255.0, alpha: 1)
    timeTableView?.measureView.tintColor = UIColor(red: 119.0/255.0, green: 121.0/255.0, blue: 120.0/255.0, alpha: 1)
    timeTableView?.gridLayer.rowLineColor = .black
    timeTableView?.gridLayer.barLineColor = UIColor(red: 42.0/255.0, green: 42.0/255.0, blue: 42.0/255.0, alpha: 1)
    timeTableView?.gridLayer.beatLineColor = UIColor(red: 42.0/255.0, green: 42.0/255.0, blue: 42.0/255.0, alpha: 1)
    timeTableView?.playheadView.tintColor = UIColor.gray.withAlphaComponent(0.5)
  }

  // MARK: MIDITimeTableViewDataSource

  func numberOfRows(in midiTimeTableView: MIDITimeTableView) -> Int {
    return rowData.count
  }

  func timeSignature(of midiTimeTableView: MIDITimeTableView) -> MIDITimeTableTimeSignature {
    return MIDITimeTableTimeSignature(beats: 4, noteValue: .quarter)
  }

  func midiTimeTableView(_ midiTimeTableView: MIDITimeTableView, rowAt index: Int) -> MIDITimeTableRowData {
    let row = rowData[index]
    return row
  }

  // MARK: MIDITimeTableViewDelegate

  func midiTimeTableViewHeightForRows(_ midiTimeTableView: MIDITimeTableView) -> CGFloat {
    return 60
  }

  func midiTimeTableViewHeightForMeasureView(_ midiTimeTableView: MIDITimeTableView) -> CGFloat {
    return 20
  }

  func midiTimeTableViewWidthForRowHeaderCells(_ midiTimeTableView: MIDITimeTableView) -> CGFloat {
    return 100
  }

  func midiTimeTableView(_ midiTimeTableView: MIDITimeTableView, didDeleteCellAt index: MIDITimeTableViewCellIndex) {
    rowData[index.row].cells.remove(at: index.column)
    timeTableView?.reloadData()
  }

  func midiTimeTableView(_ midiTimeTableView: MIDITimeTableView, didEditCellAt index: MIDITimeTableViewCellIndex, newCellRow: Int, newCellPosition: Double, newCellDuration: Double) {
    var cell = rowData[index.row].cells[index.column]
    cell.duration = newCellDuration
    cell.position = newCellPosition

    if index.row == newCellRow {
      rowData[index.row].cells[index.column] = cell
    } else { // move cell to new row
      rowData[index.row].cells.remove(at: index.column)
      rowData[newCellRow].cells.append(cell)
    }

    timeTableView?.reloadData()
  }

  func midiTimeTableView(_ midiTimeTableView: MIDITimeTableView, didUpdatePlayhead position: Double) {
    return
  }
}
